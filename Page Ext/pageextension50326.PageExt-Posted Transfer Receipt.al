pageextension 50326 pageextension50326 extends "Posted Transfer Receipt"
{
    layout
    {
        modify("Direct Transfer")
        {
            Visible = false;
        }
        addafter("Transfer-to Code")
        {
            field("Direct Transfer"; "Direct Transfer")
            {
                ApplicationArea = Location;
                Editable = false;
                ToolTip = 'Specifies that the transfer does not use an in-transit location.';
            }
        }
    }
    actions
    {
        addafter("&Receipt")
        {
            action("Item &Tracking Lines")
            {

                trigger OnAction()
                begin
                    //AAA
                    //Currpage.TransferReceiptLines.page.ShowItemTrackingLines;
                end;
            }
        }
    }
}

