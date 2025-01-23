# **Data Type Strategy NorthwellPracticeDWH claim_data.csv**

## **Overview**
This document outlines the data type strategy used for the **NorthwellPracticeDWH** project, specifically focusing on the differences between `DT_WSTR` (Unicode string) and `DT_STR` (non-Unicode string) data types in SSIS. The strategy ensures compatibility, robustness, and future-proofing of the ETL pipeline.

---

## **Purpose**
The primary goal of the data type strategy is to:
- Ensure compatibility with diverse data sources.
- Handle multilingual and special character requirements.
- Avoid data loss or errors due to encoding issues.
- Optimize the ETL process for performance and storage.

---

## **Data Type Explanation**

### **1. DT_WSTR (Unicode String)**
- **Definition**: Represents a fixed or variable-length **Unicode** string.
- **Encoding**: Uses UTF-16 encoding, allowing two bytes per character.
- **Use Case**:
  - For text data that might contain **special characters**, **accented characters**, or **multilingual content**.
  - Examples: Names, statuses, or codes with non-ASCII characters (e.g., `é`, `ü`, `你`, `اختبار`).

### **2. DT_STR (Non-Unicode String)**
- **Definition**: Represents a fixed or variable-length **non-Unicode** string.
- **Encoding**: Uses ANSI encoding, typically requiring one byte per character.
- **Use Case**:
  - For text data that only contains **plain ASCII/ANSI characters**.
  - Examples: Text fields with strictly English characters or numeric IDs stored as strings.

---

## **Why Prefer DT_WSTR Over DT_STR**

| **Criteria**               | **DT_WSTR** (Unicode)                            | **DT_STR** (Non-Unicode)                  |
|----------------------------|--------------------------------------------------|-------------------------------------------|
| **Compatibility**          | Supports all character sets, including multilingual text. | Limited to ASCII/ANSI characters only.    |
| **Future-Proofing**        | Ensures compatibility with evolving data sources. | Not suitable for systems requiring Unicode.|
| **Storage and Performance**| Uses slightly more memory and storage (2 bytes/character). | More efficient for strictly ASCII data.   |
| **Data Safety**            | No risk of losing special or non-English characters. | May cause errors or data loss for non-ASCII data. |

### **Decision: Use DT_WSTR**
In this project, most of the text-based columns are configured to use `DT_WSTR` for the following reasons:
1. **Multilingual Support**:
   - Columns like `InsuranceType`, `ReasonCode`, and `Outcome` may contain special characters or multilingual text in future datasets.
2. **Avoid Data Loss**:
   - Unicode encoding ensures no characters are lost when data flows between systems.
3. **Future-Proofing**:
   - As the project scales to handle international data or complex datasets, Unicode (`DT_WSTR`) ensures compatibility without schema changes.

---

## **Column-Specific Data Type Strategy**

| **Column**            | **Data Type (SSIS)** | **Reason**                                                                 |
|------------------------|----------------------|-----------------------------------------------------------------------------|
| **ClaimID**           | `DT_WSTR`           | Claim IDs might include alphanumeric or special characters.                |
| **ProviderID**        | `DT_WSTR`           | Supports IDs that may have extended or custom character formats.           |
| **PatientID**         | `DT_WSTR`           | Ensures compatibility for alphanumeric IDs with special characters.        |
| **DateOfService**     | `DT_DATE`           | Represents date values efficiently; no Unicode required.                   |
| **BilledAmount**      | `DT_NUMERIC`        | Decimal type for monetary amounts.                                         |
| **ProcedureCode**     | `DT_WSTR`           | Procedure codes may include letters and special characters.                |
| **DiagnosisCode**     | `DT_WSTR`           | Supports codes with non-ASCII characters.                                  |
| **AllowedAmount**     | `DT_NUMERIC`        | Decimal type for monetary values.                                          |
| **PaidAmount**        | `DT_NUMERIC`        | Decimal type for monetary values.                                          |
| **InsuranceType**     | `DT_WSTR`           | May contain descriptive text or special characters (e.g., "Self-Pay").     |
| **ClaimStatus**       | `DT_WSTR`           | Ensures multilingual or extended status values are supported.              |
| **ReasonCode**        | `DT_WSTR`           | Reason codes often require detailed text with special characters.          |
| **FollowUpRequired**  | `DT_WSTR`           | Even short text values like "Yes"/"No" use Unicode for consistency.        |
| **ARStatus**          | `DT_WSTR`           | Descriptive values that may include non-ASCII text.                        |
| **Outcome**           | `DT_WSTR`           | Ensures compatibility with varied text values like "Partially Paid".       |

---

## **Benefits of This Strategy**

1. **Data Integrity**:
   - Prevents issues like truncation, data loss, or misinterpretation of text.
2. **Flexibility**:
   - Supports a wide range of characters, ensuring compatibility with future datasets.
3. **Consistency**:
   - All text columns use a unified data type (`DT_WSTR`), simplifying transformations and downstream processing.
4. **Future Scalability**:
   - Readily handles multilingual datasets or integrations with international systems.

---

## **Exceptions to the DT_WSTR Strategy**
- **Numeric Columns**: Columns like `BilledAmount`, `AllowedAmount`, and `PaidAmount` are stored as `DT_NUMERIC` to efficiently handle numerical data.
- **Date Columns**: Date fields like `DateOfService` are stored as `DT_DATE` for proper date handling and computations.

---

## **Conclusion**
- The default choice for text-based columns is `DT_WSTR`, ensuring robustness and flexibility.
- `DT_STR` is only considered when the data source and downstream systems are guaranteed to use plain ASCII text.
- Numeric and date columns follow standard practices (`DT_NUMERIC` and `DT_DATE`).

By adopting this strategy, the ETL pipeline is equipped to handle current and future data requirements without risk of character encoding issues.

---