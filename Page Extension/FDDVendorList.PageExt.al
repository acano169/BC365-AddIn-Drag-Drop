pageextension 81702 "FDD Vendor List" extends "Vendor List"
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
