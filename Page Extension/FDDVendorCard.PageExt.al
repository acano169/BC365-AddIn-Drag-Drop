pageextension 81703 "FDD Vendor Card" extends "Vendor Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(23), "No." = field("No.");
            }
        }
    }
}
