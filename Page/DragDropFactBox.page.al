page 81700 "Drag & Drop FactBox"
{
    Caption = 'Content Drag & Drop', comment = 'ESP="Arrastrar y soltar"';
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Document Attachment";
    InsertAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;
    Permissions = TableData "Document Attachment" = rm;

    layout
    {
        area(content)
        {
            usercontrol(FileDragAndDrop; "File Drag and Drop")
            {
                ApplicationArea = All;

                trigger ControlAddinReady()
                begin
                    CurrPage.FileDragAndDrop.InitializeFileDragAndDrop();
                end;

                trigger OnFileUpload(FileName: Text; FileAsText: Text; IsLastFile: Boolean)
                var
                    Base64Convert: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    FileInStream: InStream;
                    FileOutStream: OutStream;
                begin
                    TempBlob.CreateOutStream(FileOutStream, TextEncoding::UTF8);
                    Base64Convert.FromBase64(FileAsText.Substring(FileAsText.IndexOf(',') + 1), FileOutStream);
                    TempBlob.CreateInStream(FileInStream, TextEncoding::UTF8);

                    Rec.ID := 0;
                    Rec.SaveAttachmentFromStream(FileInStream, GetSourceRecRefPK1(), FileName);

                    if IsLastFile then
                        CurrPage.Update(false);
                end;
            }
            repeater(Rep)
            {
                ShowCaption = false;
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.', comment = 'ESP="Especifica el nombre del archivo."';

                    trigger OnDrillDown()
                    begin
                        if SupportedByFileViewer() then
                            ViewFile()
                        else
                            Rec.Export(true);
                    end;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Extensions field.', comment = 'ESP="Especifica la extensión del archivo."';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(DownloadFile)
            {
                ApplicationArea = All;
                Caption = 'Download File', comment = 'ESP="Descargar archivo"';
                ToolTip = 'Download File', comment = 'ESP="Descargar archivo"';
                Image = Download;
                Enabled = Rec."File Name" <> '';
                trigger OnAction()
                begin
                    FDDExport(true);
                end;
            }
        }
    }

    local procedure GetSourceRecRefPK1(): RecordRef
    var
        RecRef: RecordRef;
        FieldRefNo: FieldRef;
        TableNo: Integer;
        TablePK: Text;
        FieldId: Integer;
    begin
        Rec.FilterGroup(4);
        Evaluate(TableNo, Rec.GetFilter("Table ID"));
        Evaluate(TablePK, Rec.GetFilter("No."));
        RecRef.Open(TableNo);

        FieldId := GetFieldIdByName(RecRef, 'No.');
        if FieldId = 0 then
            Error('El campo "No." no se encuentra en la tabla con ID %1.', TableNo);

        FieldRefNo := RecRef.Field(FieldId);
        FieldRefNo.SetRange(TablePK);

        RecRef.FindFirst();
        Rec.FilterGroup(0);
        exit(RecRef);
    end;


    local procedure GetFieldIdByName(RecRef: RecordRef; FieldName: Text): Integer
    var
        DataTypeManagement: Codeunit "Data Type Management";
        FldRef: FieldRef;
    begin
        if DataTypeManagement.FindFieldByName(RecRef, FldRef, FieldName) then
            exit(FldRef.Number);
        exit(0);
    end;

    procedure FDDExport(ShowFileDialog: Boolean): Text
    var
        TempBlob: Codeunit "Temp Blob";
        FileManagement: Codeunit "File Management";
        DocumentStream: OutStream;
        FullFileName: Text;
    begin
        if Rec.ID = 0 then
            exit;

        if not Rec."Document Reference ID".HasValue then
            exit;

        FullFileName := Rec."File Name" + '.' + Rec."File Extension";
        TempBlob.CreateOutStream(DocumentStream);
        Rec."Document Reference ID".ExportStream(DocumentStream);
        exit(FileManagement.BLOBExport(TempBlob, FullFileName, ShowFileDialog));
    end;

    internal procedure SupportedByFileViewer(): Boolean
    begin
        case Rec."File Type" of
            Rec."File Type"::PDF:
                exit(true);
            Rec."File Type"::" ":
                begin
                    if Rec."File Extension" <> '' then
                        exit(LowerCase(Rec."File Extension") = 'pdf');

                    exit(Lowercase(Rec."File Name").EndsWith('pdf'))
                end;
            else
                exit(false);
        end;
    end;

    internal procedure ViewFile()
    var
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
    begin
        Rec.GetAsTempBlob(TempBlob);
        TempBlob.CreateInStream(FileInStream);
        File.ViewFromStream(FileInStream, Rec."File Name" + '.' + Rec."File Extension", true);
    end;
}
