pageextension 81719 "FDD Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(112), "No." = field("No.");
            }
        }
    }
}
