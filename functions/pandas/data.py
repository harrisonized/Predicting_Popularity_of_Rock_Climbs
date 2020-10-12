import pandas as pd
pd.set_option('mode.chained_assignment', None)


# Objects included in this file:

# Functions included in this file:
# # dict_to_col


def dict_to_col(df, col: str, to_include=False, prefix=None):
    """Expands a single dataframe column containing dictionaries into columns.
    Input:
    idx_1 | ... | new_col
    ------+-----+--------------------------------------
    idx_1 | ... | {'key_1': val_1, 'key_2': val_2, ...}

    Returns:
    idx_0 | ... | key_1 | key_2 | ...
    ------+-----+-------+-------+-----
    val_0 | ... | val_1 | val_2 | ...
    """
    df = df.reset_index(drop=True) # required for this to work correctly
    if prefix:
        df = df.join(df[col].apply(lambda x: pd.Series(x).add_prefix(f'{prefix}_')))
    else:
        df = df.join(df[col].apply(pd.Series))
    
    if to_include:
        return df
    else:
        return df.drop(columns=[col])
