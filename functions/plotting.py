import json
import numpy as np
import pandas as pd
import pandas.io.sql as pd_sql

import matplotlib.pyplot as plt
import seaborn as sns
import statsmodels.api as sm


# Objects included in this file:

# Functions included in this file:
# # plot_empty
# # plot_heatmap
# # plot_single_scatter
# # plot_histogram
# # plot_qq


def plot_empty(xlabel=None, ylabel=None,
               title=None,
               figsize=(8,5),
               color=None):
    """Convenience function
    """
    fig = plt.figure(figsize=figsize)
    
    ax = fig.gca()
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    
    return fig, ax


def plot_heatmap(df, title, order=None, figsize=(8, 5)):
    """
    """
    fig = plt.figure(figsize=figsize)
    
    if order:
        df = df[order]
    sns.heatmap(df.corr(), cmap= 'coolwarm', annot=True)
    
    ax = fig.gca()
    ax.set_title(title, fontsize = 18)
    return fig


def plot_single_scatter(df, x, y,
                 xlabel=None, ylabel=None,
                 title=None,
                 color=None,
                 figsize=(8, 5)
                ):
    """
    """
    fig = plt.figure(figsize=figsize)
    plt.scatter(df[x], df[y], color=color)
    
    if xlabel is None:
        xlabel = x
    if ylabel is None:
        ylabel = y
        
    ax = fig.gca()
    ax.set_xlabel(xlabel, fontsize=16)
    ax.set_ylabel(ylabel, fontsize=16)
    ax.set_title(title, fontsize = 18)
    
    return fig


def plot_histogram(df, x, bins, xlabel=None, ylabel=None, title=None, figsize=(8, 5)):
    """
    """
    fig = plt.figure(figsize=figsize)

    ax = fig.gca()
    ax.hist(df[x], bins=bins, color='#8d1a93')

    ax.set_xlabel(xlabel, fontsize=16)
    ax.set_ylabel(ylabel, fontsize=16)
    ax.set_title(title, fontsize = 18)
    
    return fig


def plot_qq(vals, xlabel, ylabel, title):
    """vals should be a list of residuals
    """
    fig = sm.qqplot(vals, line='s', color='#1f77b4')
    
    plt.xlabel(xlabel, fontsize=16)
    plt.ylabel(ylabel, fontsize=16)
    plt.title(title, fontsize=18)
    
    return fig
