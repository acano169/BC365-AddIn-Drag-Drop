pageextension 81705 "FDD Sales Order" extends "Sales Order"
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
