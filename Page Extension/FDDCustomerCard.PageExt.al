pageextension 81701 "FDD Customer Card" extends "Customer Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(18), "No." = field("No.");
            }
        }
    }
}
