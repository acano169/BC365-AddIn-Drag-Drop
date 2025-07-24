pageextension 81706 "FDD Sales Quotes" extends "Sales Quotes"
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
