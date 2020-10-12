import re
import pandas as pd
pd.set_option('mode.chained_assignment', None)


# Objects included in this file:

# Functions included in this file:
# # title_to_snake_case
# # snake_to_pascal_case
# # add_space_to_prefix


def title_to_snake_case(text):
    """Converts "Column Title" to column_title
    """
    return text.lower().replace(' ', '_').replace('-', '_')


def snake_to_pascal_case(text):
    """Converts column_title to ColumnTitle
    """
    return ''.join(map(lambda x: x.capitalize(), text.split('_')))


def add_space_to_prefix(text, prefixes: list):
    prefix_regex = '('+'|'.join(prefixes)+')'
    return re.sub(prefix_regex, r'\1 ', text)
