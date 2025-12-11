# tmux Configuration Style Guide

This document defines the visual separator style and organization conventions for `tmux.conf` to maintain consistency across future edits.

## Visual Separator Styles

### Major Section Separators

Use this format for top-level configuration sections:

```tmux
# ============================================================================
# SECTION NAME
# ============================================================================
```

**When to use:**
- Separating major functional areas of the configuration
- Examples: GENERAL CONFIGURATION, PREFIX KEY, KEY BINDINGS, COPY MODE, PLUGINS

**Formatting rules:**
- 76 equal signs (=) for visual consistency
- Section name in ALL CAPS
- One blank line before the separator
- One blank line after the separator (before content)

### Sub-section Separators

Use this format for subsections within a major section:

```tmux
# --- Subsection Name ---
```

**When to use:**
- Organizing related settings within a major section
- Grouping similar keybindings
- Examples: Window Selection, Pane Navigation, Pane Resizing

**Formatting rules:**
- Three dashes before and after
- Title Case for subsection names
- One blank line before the separator (after previous content)
- No blank line after the separator (content starts immediately)

## Configuration Organization

### Section Order

Maintain this order of major sections:

1. **GENERAL CONFIGURATION** - Core tmux settings (mouse, vi-mode, indexing, performance)
2. **PREFIX KEY** - Prefix key configuration and bindings
3. **KEY BINDINGS** - All custom keybindings, organized into subsections
4. **COPY MODE** - Copy mode specific bindings and settings
5. **PLUGINS** - Plugin declarations and plugin-specific settings

### Key Bindings Sub-sections

Organize keybindings in this order:

1. Config & Session Management
2. Window Selection
3. Pane Navigation
4. Pane Resizing
5. Splitting Windows
6. Window & Pane Management
7. Search

## Examples

### Good Example

```tmux
# ============================================================================
# KEY BINDINGS
# ============================================================================

# --- Window Selection ---
bind 1 select-window -t 1
bind 2 select-window -t 2
bind 3 select-window -t 3

# --- Pane Navigation ---
bind Left select-pane -L
bind Right select-pane -R
```

### Bad Example

```tmux
# KEY BINDINGS
# ===================

#Window Selection
bind 1 select-window -t 1

# --- pane navigation ---
bind Left select-pane -L
```

**Issues:**
- Inconsistent separator length
- Missing blank lines
- Wrong capitalization
- Missing dashes in subsection

## General Formatting Guidelines

1. **Blank Lines**
   - Use blank lines to separate logical groups of settings
   - One blank line between different setting types
   - One blank line before subsection separators

2. **Comments**
   - Use inline comments sparingly, only when the setting isn't self-explanatory
   - Prefer descriptive subsection names over inline comments

3. **Alignment**
   - Left-align all settings and bindings
   - No need to align values vertically

4. **Plugin Configuration**
   - Keep plugin-specific settings together in the PLUGINS section
   - List plugins in order: tpm first, then theme, then functionality plugins
   - Plugin settings immediately after plugin declarations

## Future Edits

When adding new settings or bindings:

1. Identify the appropriate major section
2. Find or create the appropriate subsection
3. Add the new setting/binding in the logical location
4. Maintain blank line conventions
5. Update this guide if introducing new section types

## Notes

- This style guide prioritizes readability and quick navigation
- Consistency is more important than brevity
- When in doubt, match existing patterns in the file