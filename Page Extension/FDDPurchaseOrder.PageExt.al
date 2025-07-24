pageextension 81713 "FDD Purchase Order" extends "Purchase Order"
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
