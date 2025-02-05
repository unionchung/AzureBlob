table 88100 "ABS Container setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Account Name"; Text[250])
        {
            Caption = 'Account Name';
        }
        field(3; "Container Name"; Text[250])
        {
            Caption = 'Container Name';
        }
        field(4; "Shared Access Key"; Text[250])
        {
            Caption = 'Shared Access Key';
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}