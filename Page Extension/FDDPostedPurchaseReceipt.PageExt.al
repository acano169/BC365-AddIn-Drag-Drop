pageextension 81717 "FDD Posted Purchase Receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(120), "No." = field("No.");
            }
        }
    }
}
