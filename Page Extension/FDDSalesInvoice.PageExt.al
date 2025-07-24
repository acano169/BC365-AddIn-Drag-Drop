pageextension 81709 "FDD Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(36), "No." = field("No.");
            }
        }
    }
}
