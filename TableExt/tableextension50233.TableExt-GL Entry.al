tableextension 50233 tableextension50233 extends "G/L Entry"
{
    fields
    {
        field(50026; "Old External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(50300; "Maintenance Code"; Code[10])
        {
        }
        field(50301; "Job No"; Integer)
        {
        }
    }
    keys
    {
        key(ASLKey1; "G/L Account No.", "Posting Date", "External Document No.", "Reason Code")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key2; "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Close Income Statement Dim. ID", "Posting Date", "Reason Code", "External Document No.")
        {
            SumIndexFields = Amount, "Debit Amount", "Credit Amount", "Additional-Currency Amount", "Add.-Currency Debit Amount", "Add.-Currency Credit Amount";
        }
        key(Key3; "External Document No.", "G/L Account No.", "Reason Code")
        {
        }
        key(Key4; "FA Entry Type")
        {
            Enabled = false;
        }
        key(Key5; "Document No.", "Transaction No.")
        {
        }
        key(Key6; "G/L Account No.", "Job No.", "Gen. Prod. Posting Group")
        {
            SumIndexFields = Amount;
        }
    }
}

