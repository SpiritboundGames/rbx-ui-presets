-- #region Enum_ItemFields

export type Enum_ItemField = {
    TextField: number,
    DropdownField: number
};

-- #endregion

-- #region ItemFields

    -- #region Base_ItemField

    export type Object_Base_ItemField = {
        BackFrame: Frame,
        InnerFrame: Frame,
        ItemLabel: TextLabel,
        ValueChanged: any
    };

    export type Schema_Base_ItemField = {
        __index: any,

        newBase: () -> Base_ItemField,
        AddValue:<T> (self: T | Base_ItemField,valueObj: GuiObject,posOverride: UDim2?) -> (),
        SetParent:<T> (self: T | Base_ItemField,parent: Instance) -> ()
    };

    export type Base_ItemField = Object_Base_ItemField & Schema_Base_ItemField;

    -- #endregion

    -- #region TextField
  
        export type Object_TextField = Object_Base_ItemField & {
            ValueField: TextBox,
            Value: string
        };

        export type Schema_TextField = Schema_Base_ItemField & {
            new: () -> TextField
        };

        export type TextField = Object_TextField & Schema_TextField;

    -- #endregion

    -- #region DropdownField

        export type Object_DropdownField = Object_Base_ItemField & {
            _orderedElements: {string},
            _correlationDictionary: {[string]: number} | {[string]: number}
        };

        export type Schema_DropdownField = Schema_Base_ItemField & {
            new: (dropdownElements: {string} | {[string]: number} | {[string]: string}, defaultValue: number | string) -> DropdownField
        };

        export type DropdownField = Object_DropdownField & Schema_DropdownField;

    -- #endregion

-- #endregion

export type PresetSchemas = {
    ItemField: Schema_Base_ItemField,
    TextField: Schema_TextField,
    DropdownField: Schema_DropdownField
};

export type UIPresets = {
    Preset: PresetSchemas,
    Field: Enum_ItemField,

    newField:<T> (itemField: number, ...any) -> T
};

return true;