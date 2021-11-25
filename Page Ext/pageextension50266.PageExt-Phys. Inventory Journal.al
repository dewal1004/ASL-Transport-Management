pageextension 50266 pageextension50266 extends "Phys. Inventory Journal"
{
    layout
    {
        modify(ShortcutDimCode8)
        {
            Visible = false;
        }
        addafter(ShortcutDimCode7)
        {
            field(ShortcutDimCode8; ShortcutDimCode[8])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,8';
                TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (8),
                                                              "Dimension Value Type" = CONST (Standard),
                                                              Blocked = CONST (false));
                Visible = DimVisible8;

                trigger OnValidate()
                begin
                    ValidateShortcutDimCode(8, ShortcutDimCode[8]);

                    OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 8);
                end;
            }
        }
    }
    actions
    {
        addafter("Phys. In&ventory Ledger Entries")
        {
            action("Item &Tracking Entries")
            {
                RunObject = Page "Item Tracking Entries";
            }
        }
    }
}

