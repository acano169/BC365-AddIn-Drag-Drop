pageextension 81714 "FDD Purchase Invoices" extends "Purchase Invoices"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(38), "No." = field("No.");
            }
        }
    }
}
