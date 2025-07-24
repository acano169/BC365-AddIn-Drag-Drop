pageextension 81712 "FDD Purchase Order List" extends "Purchase Order List"
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
