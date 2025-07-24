pageextension 81716 "FDD Posted Purchase Receipts" extends "Posted Purchase Receipts"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(120), "No." = field("No.");
            }
        }
    }
}
