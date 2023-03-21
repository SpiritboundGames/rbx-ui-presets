-- #region Enum_ItemFields

export type Enum_ItemField = {
    TextField: number,
    EnumField: number
};

-- #endregion

-- #region ItemField
export type Object_ItemField = {};

export type Schema_ItemField = {
    __index: Schema_ItemField,
    Field: Enum_ItemField,

    new: (itemField: number) -> ItemField
};

export type ItemField = Object_ItemField & Schema_ItemField;
-- #endregion
return true;