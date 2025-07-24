pageextension 81708 "FDD Sales Invoice List" extends "Sales Invoice List"
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
