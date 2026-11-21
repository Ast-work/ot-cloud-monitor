
## Detection Engineering – FC15 Modbus Write Detection

### Objective
Create a function-specific Suricata rule to identify Modbus Write Multiple Coils (FC15) requests.

### Rules
- SID 1001001: General Modbus write detection.
- SID 1001002: FC15 Write Multiple Coils detection.

### Validation
Both rules were executed against pcaps/sample.pcap.

- General write rule: 44 alerts.
- FC15-specific rule: 44 alerts.
- Observed source: 141.81.0.10
- Observed destination: 141.81.0.46

### Assessment
The FC15-specific rule successfully detected the observed Modbus write activity. Both rules generated the same alert count in this test. These counts are alert events, not necessarily unique Modbus transactions or confirmed security incidents.

### Limitation
The detection identifies protocol activity, not malicious intent. Authorisation and operational context must be validated separately.
