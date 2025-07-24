pageextension 81710 "FDD Posted Sales Shipments" extends "Posted Sales Shipments"
{
    layout
    {
        addfirst(factboxes)
        {
            part(FDDDragAndDropFactbox; "Drag & Drop Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(110), "No." = field("No.");
            }
        }
    }
}
