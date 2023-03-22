-- #region Enum_ItemFields

export type Enum_ItemField = {
    TextField: number,
    EnumField: number
};

-- #endregion

-- #region ItemFields

    -- #region Base_ItemField

    export type Object_Base_ItemField = {
        BackFrame: Frame,
        InnerFrame: Frame,
        ItemLabel: TextLabel
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
            ValueField: TextBox
        };

        export type Schema_TextField = Schema_Base_ItemField & {
            new: () -> TextField
        };

        export type TextField = Object_TextField & Schema_TextField;

    -- #endregion

    -- #region EnumField

        export type Object_EnumField = Object_Base_ItemField & {};

        export type Schema_EnumField = Schema_Base_ItemField & {
            new: (enumDictionary: {[string]: number | string}) -> EnumField
        };

        export type EnumField = Object_TextField & Schema_EnumField;

    -- #endregion

-- #endregion

export type PresetSchemas = {
    ItemField: Schema_Base_ItemField,
    TextField: Schema_TextField,
    EnumField: Schema_EnumField
};

export type UIPresets = {
    Preset: PresetSchemas,
    Field: Enum_ItemField,

    newField:<T> (itemField: number, any...) -> T
};

return true;