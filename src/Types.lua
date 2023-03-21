-- #region Enum_ItemFields

export type Enum_ItemField = {
    TextField: number,
    EnumField: number
};

-- #endregion

-- #region ItemFields

    -- #region Base_ItemField

    export type Object_Base_ItemField = {};

    export type Schema_Base_ItemField = {
        __index: any,

        newBase: () -> Base_ItemField
    };

    export type Base_ItemField = Object_Base_ItemField & Schema_Base_ItemField;

    -- #endregion

    -- #region TextField
  
        export type Object_TextField = {};

        export type Schema_TextField = {};

        export type TextField = Object_TextField & Schema_TextField;

    -- #endregion

    -- #region EnumField

        export type Object_EnumField = Object_Base_ItemField & {};

        export type Schema_EnumField = Schema_Base_ItemField & {
            __index: any,

            new: () -> EnumField
        };

        export type EnumField = Object_EnumField & Schema_EnumField;

    -- #endregion

-- #endregion

export type ItemField = TextField | EnumField

return true;