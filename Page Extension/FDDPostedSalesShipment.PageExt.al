pageextension 81711 "FDD Posted Sales Shipment" extends "Posted Sales Shipment"
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
