# Customer Hub Report Examples

This document shows example outputs and customization options for the Customer Hub reporting system.

## Report Types

### Territory Dashboard (Default)
The main overview report showing all customers in a tabular format.

**Key Features:**
- Health indicator dots (🟢 Green = Healthy, 🟡 Yellow = At Risk, 🔴 Red = Critical)
- Days since last contact with color coding:
  - Green: Recent contact (≤21 days)
  - Yellow: Going cold (22-45 days)
  - Red: Critical (>45 days)
- Sortable columns (click headers to sort)
- Search and filter functionality
- Summary statistics at the top

**Example Usage:**
```bash
# Basic territory dashboard
python scripts/generate_report.py

# Save to custom location
python scripts/generate_report.py --output ~/Desktop/territory-report.html

# Auto-open in browser
python scripts/generate_report.py --open
```

### Customer Deep Dive
Detailed single-customer report with full context.

**Includes:**
- Complete stakeholder list
- Meeting timeline (chronological)
- All open action items
- Architecture overview
- Competitive landscape
- Opportunity summary

**Example Usage:**
```bash
# Generate deep dive for BSWH
python scripts/generate_report.py --customer bswh

# With custom output
python scripts/generate_report.py --customer acme-corp --output reports/acme-analysis.html
```

### Weekly Activity Report
Summary of recent activity and attention-needed customers.

**Shows:**
- Customers touched vs untouched this week
- Going cold warnings (prioritized by days)
- Meeting activity summary

**Example Usage:**
```bash
python scripts/generate_report.py --weekly
```

## Customization Options

### Changing Color Scheme
Edit the `colors` dictionary in the `CustomerHubReporter.__init__()` method:

```python
self.colors = {
    'primary': '#2563EB',    # Blue - change to your brand color
    'success': '#10B981',    # Green for healthy status
    'warning': '#F59E0B',    # Yellow for at-risk
    'danger': '#EF4444',     # Red for critical
    'gray': '#6B7280',       # Text color
    'gray_light': '#F3F4F6', # Background
    'gray_dark': '#374151'   # Headers
}
```

### Adjusting Contact Frequency Thresholds
Modify the warning thresholds in `get_contact_frequency_class()`:

```python
def get_contact_frequency_class(self, days_since):
    if days_since > 60:      # Change from 45 to 60 days
        return 'contact-danger'
    elif days_since > 30:    # Change from 21 to 30 days
        return 'contact-warning'
    else:
        return 'contact-good'
```

### Adding Custom Sections
To add new sections to reports, extend the `parse_customer_context()` method:

```python
# Parse custom files
custom_file = context_dir / "custom-data.md"
if custom_file.exists():
    with open(custom_file, 'r', encoding='utf-8') as f:
        data['custom_field'] = f.read()
```

### Styling Modifications
All CSS is inline within the HTML templates. Key style sections:

- `.header` - Top banner styling
- `.stat-card` - Summary statistics cards
- `.customer-row` - Table row styling
- `.contact-warning`, `.contact-danger` - Alert color coding

## Expected Data Structure

The script expects this customer directory structure:

```
customer-hub/
├── customers.md              # Main index with health status
├── cust/
│   └── customer-name/
│       └── context/
│           ├── index.md      # Overview, action items
│           ├── personas.md   # Stakeholder list
│           ├── architecture.md
│           ├── opp-history.md
│           ├── competitors.md
│           ├── CHANGELOG.md
│           └── meeting-notes/
│               ├── 2025-01-15_strategy-meeting.md
│               └── 2025-02-03_technical-review.md
```

## File Naming Conventions

### Meeting Notes
Use the format: `YYYY-MM-DD_description.md`

Examples:
- `2025-03-15_quarterly-review.md`
- `2025-03-20_POC-kickoff.md`
- `2025-03-25_stakeholder-meeting.md`

This ensures proper date parsing for recency calculations.

### Customer Directories
Use lowercase with hyphens: `customer-name` not `Customer Name` or `customer_name`

## Troubleshooting

### No Customers Found
- Verify you're running from the customer-hub root directory
- Check that `cust/` directory exists and contains customer folders
- Ensure customer folders have `context/` subdirectories

### Missing Data
The script handles missing files gracefully, showing:
- "Never" for missing meeting dates
- Empty counts for missing stakeholders/action items
- Placeholder text for missing content

### Performance
- Reports generate in ~2-3 seconds for 20-50 customers
- Large customer bases (>100) may take 10-15 seconds
- Consider using `--customer` flag for quick single-customer reports

## Output Examples

### Default Filename Pattern
- `territory-report-2025-03-24.html`
- `customer-bswh-2025-03-24.html`
- `weekly-report-2025-03-24.html`

All reports are saved to `data/outputs/` unless a custom path is specified.