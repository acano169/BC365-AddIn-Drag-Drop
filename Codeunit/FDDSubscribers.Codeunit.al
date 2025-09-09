codeunit 81700 "FDD Subscribers"
{
    /*[EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeSaveAttachmentFromStream', '', true, true)]
    local procedure OnBeforeSaveAttachmentFromStreamT1173(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FileName: Text; var DocStream: InStream)
    var
        ICPartner: Record "IC Partner";
        ICSetup: Record "IC Setup";
    begin
        ICSetup.Get();
        if (ICPartner.FindFirst() and ICPartner."SFK Caudal Intercompany") then begin
            DocumentAttachment.ChangeCompany(ICPartner."Inbox Details");
            RecRef.ChangeCompany(ICPartner."Inbox Details");
        end;
    end;*/
}