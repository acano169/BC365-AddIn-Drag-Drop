pageextension 81700 "FDD Customer List" extends "Customer List"
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
