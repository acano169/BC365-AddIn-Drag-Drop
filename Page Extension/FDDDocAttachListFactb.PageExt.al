pageextension 81720 "FDD Doc. Attach. List Factb." extends "Doc. Attachment List Factbox"
{
    /*layout
    {
        modify(Name)
        {
            trigger OnDrillDown()
            begin
                CheckCompanyChange();
                if Rec.SupportedByFileViewer() then
                    Rec.ViewFile()
                else
                    Rec.Export(true);
            end;
        }
    }*/

    actions
    {
        modify(DownloadInRepeater)
        {
            Visible = not IC;
        }
        modify(OpenInDetail)
        {
            Visible = not IC;
        }
        modify(AttachmentsUpload)
        {
            Visible = not IC;
        }
        modify(AttachFromEmail)
        {
            Visible = not IC;
        }
        modify(OpenInFileViewer)
        {
            Visible = not IC;
        }
    }

    trigger OnOpenPage()
    var
        ICPartner: Record "IC Partner";
        ICSetup: Record "IC Setup";
    begin
        //CheckCompanyChange();
        ICSetup.Get();
        if (ICPartner.FindFirst() and ICPartner."SFK Caudal Intercompany") then
            IC := true;
    end;

    procedure CheckCompanyChange()
    var
        ICPartner: Record "IC Partner";
        ICSetup: Record "IC Setup";
    begin
        ICSetup.Get();
        if (ICPartner.FindFirst() and ICPartner."SFK Caudal Intercompany") then begin
            Rec.ChangeCompany(ICPartner."Inbox Details");
            if not Rec.GetBySystemId(Rec.SystemId) then
                exit;
        end;
    end;

    var
        IC: Boolean;
}