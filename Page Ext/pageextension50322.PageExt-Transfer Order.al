pageextension 50322 pageextension50322 extends "Transfer Order"
{
    layout
    {
        modify("Direct Transfer")
        {
            Visible = false;
        }
        modify("Transfer-from County")
        {
            Visible = false;
        }
        modify("Trsf.-to Country/Region Code")
        {
            Visible = false;
        }
        addafter("Transfer-to Code")
        {
            field("Direct Transfer"; "Direct Transfer")
            {
                ApplicationArea = Location;
                Editable = (Status = Status::Open) AND EnableTransferFields;
                Importance = Promoted;
                ToolTip = 'Specifies that the transfer does not use an in-transit location. When you transfer directly, the Qty. to Receive field will be locked with the same value as the quantity to ship.';

                trigger OnValidate()
                begin
                    CurrPage.Update;
                end;
            }
        }
        addafter("Posting Date")
        {
            field("Transfer Template"; "Transfer Template")
            {
            }
        }
        addfirst(Control17)
        {
            field("Transfer-from County"; "Transfer-from County")
            {
                ApplicationArea = Location;
                Caption = 'County';
                Importance = Additional;
                QuickEntry = false;
            }
        }
        addafter("Transfer-to Post Code")
        {
            field("Trsf.-to Country/Region Code"; "Trsf.-to Country/Region Code")
            {
                ApplicationArea = Location;
                Caption = 'Country/Region';
                Importance = Additional;
                QuickEntry = false;

                trigger OnValidate()
                begin
                    IsToCountyVisible := FormatAddress.UseCounty("Trsf.-to Country/Region Code");
                end;
            }
        }
    }
    actions
    {
        addfirst("O&rder")
        {
            action("Short Supply")
            {
                RunObject = Report "Sales Register";
            }
        }
        addafter("&Print")
        {
            action("Print Delivery Note")
            {
                Image = Delivery;
                RunPageOnRec = true;

                trigger OnAction()
                begin
                    TrasRec.SetRange(TrasRec."No.", "No.");
                    if TrasRec.FindFirst then
                        REPORT.RunModal(50033, true, false, TrasRec);
                end;
            }
        }
        addafter(PostAndPrint)
        {
            action("Post Through")
            {
                Caption = 'Post Through';
                Image = Post;

                trigger OnAction()
                begin
                    if Loc.Get("Transfer-from Code") then;
                    if Loc."Location Type" = 1 then TestField("Transfer From Voy. No.");
                    if Loc.Get("Transfer-to Code") then;
                    if Loc."Location Type" = 1 then TestField("Transfer To Voy. No.");
                    //TESTFIELD("Previous Voyage Expensed",TRUE);
                    CODEUNIT.Run(CODEUNIT::"TransferOrder-Post Shipment", Rec);
                    CurrPage.Update;
                    CODEUNIT.Run(CODEUNIT::"TransferOrder-Post Receipt", Rec);
                    /*IF UserSetup.GET("Assigned User ID") THEN
                      Recipient := UserSetup."E-Mail";
                    IF Recipient <> '' THEN BEGIN
                      MailBody := '';
                      MailBody := Mail.FormatTextForHtml(STRSUBSTNO('Hello,<br /> Your transfer order: %1 has been processed. <br />Regards.<br />',"No."));
                      Subject := STRSUBSTNO('Processed Transfer Order for Production - %1',"No.");
                      Mail.CreateMessage(Recipient,'','',Subject,MailBody,FALSE,FALSE);
                      Mail.Send;

                      END ELSE BEGIN
                      MailBody := Mail.FormatTextForHtml(STRSUBSTNO('Hello,<br /> Your transfer order: %1 has been processed. <br />Regards',"No."));
                      Subject := STRSUBSTNO('Processed Transfer Order for Production - %1',"No.");
                      Mail.NewMessage('','','',Subject,MailBody,'',TRUE);
                    END;
                    */

                end;
            }
            group(Notification)
            {
                Caption = 'Notification';
            }
        }
    }

    var
        Loc: Record Location;
        UserSetup: Record "User Setup";
        Mail: Codeunit Mail;
        MailBody: Text;
        Subject: Text;
        Recipient: Text;
        TrasRec: Record "Transfer Header";


        //Unsupported feature: Code Insertion on "OnInsertRecord".

        //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
        //begin
        /*
         "Assigned User ID" := UserId;
          //IF UserSetup.GET(USERID) THEN
            //"Requested By" := UserSetup.
        */
        //end;
}

