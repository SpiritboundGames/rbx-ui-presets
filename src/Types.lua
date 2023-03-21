-- #region ItemField
export type Object_ItemField = {};

export type Schema_ItemField = {
    __index: Schema_ItemField,

    new: () -> ()
};

export type ItemField = Object_ItemField & Schema_ItemField;
-- #endregion
return true;