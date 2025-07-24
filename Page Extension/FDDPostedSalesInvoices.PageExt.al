pageextension 81718 "FDD Posted Sales Invoices" extends "Posted Sales Invoices"
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
