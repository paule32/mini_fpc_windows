
unit WinTypes;
interface
type
    TGUID = record
        Data1: DWORD;
        Data2: WORD;
        Data3: WORD;
        Data4: Array[0..7] of ShortInt;
    end;
    
    REFCLSIID = TGUID;
    REFIID    = TGUID;

    THandle   = NativeUInt;
    HINST     = THandle;
    HMODULE   = HINST;

implementation
begin
end.
