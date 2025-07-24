pageextension 81715 "FDD Purchase Invoice" extends "Purchase Invoice"
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
