pageextension 81707 "FDD Sales Quote" extends "Sales Quote"
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
