package webridge.sql.types;

import webridge.exception.NotImplementedException;

import java.io.*;
import java.sql.SQLException;

// heavily referred to MySQL JDBC connector's Clob implementation
public class Clob implements java.sql.Clob {
  private String charData;

  public Clob(String charDataInit) {
    this.charData = charDataInit;
  }

  /** @see java.sql.Clob#getAsciiStream() */
  public InputStream getAsciiStream() throws SQLException {
    if (this.charData != null) {
      return new ByteArrayInputStream(this.charData.getBytes());
    }

    return null;
  }

  /** @see java.sql.Clob#getCharacterStream() */
  public Reader getCharacterStream() throws SQLException {
    if (this.charData != null) {
      return new StringReader(this.charData);
    }

    return null;
  }

  /** @see java.sql.Clob#getSubString(long, int) */
  public String getSubString(long startPos, int length) throws SQLException {
    if (startPos < 1) {
      throw new RuntimeException();
    }

    int adjustedStartPos = (int) startPos - 1;
    int adjustedEndIndex = adjustedStartPos + length;

    if (this.charData != null) {
      if (adjustedEndIndex > this.charData.length()) {
        throw new RuntimeException();
      }

      return this.charData.substring(adjustedStartPos, adjustedEndIndex);
    }

    return null;
  }

  /** @see java.sql.Clob#length() */
  public long length() throws SQLException {
    if (this.charData != null) {
      return this.charData.length();
    }

    return 0;
  }

  public long position(java.sql.Clob arg0, long arg1) throws SQLException {
    return position(arg0.getSubString(1L, (int) arg0.length()), arg1);
  }

  /** @see java.sql.Clob#position(String, long) */
  public long position(String stringToFind, long startPos) throws SQLException {
    if (startPos < 1) {
      throw new RuntimeException();
    }

    if (this.charData != null) {
      if ((startPos - 1) > this.charData.length()) {
        throw new RuntimeException();
      }

      int pos = this.charData.indexOf(stringToFind, (int) (startPos - 1));

      return (pos == -1) ? (-1) : (pos + 1);
    }

    return -1;
  }

  /** @see java.sql.Clob#setAsciiStream(long) */
  public OutputStream setAsciiStream(long indexToWriteAt) throws SQLException {
    throw new NotImplementedException();
  }

  /** @see java.sql.Clob#setCharacterStream(long) */
  public Writer setCharacterStream(long indexToWriteAt) throws SQLException {
    throw new NotImplementedException();
  }

  /** @see java.sql.Clob#setString(long, String) */
  public int setString(long pos, String str) throws SQLException {
    if (pos < 1) {
      throw new RuntimeException();
    }

    if (str == null) {
      throw new RuntimeException();
    }

    StringBuilder charBuf = new StringBuilder(this.charData);

    pos--;

    int strLength = str.length();

    charBuf.replace((int) pos, (int) (pos + strLength), str);

    this.charData = charBuf.toString();

    return strLength;
  }

  /** @see java.sql.Clob#setString(long, String, int, int) */
  public int setString(long pos, String str, int offset, int len) throws SQLException {
    if (pos < 1) {
      throw new RuntimeException();
    }

    if (str == null) {
      throw new RuntimeException();
    }

    StringBuilder charBuf = new StringBuilder(this.charData);

    pos--;

    try {
      String replaceString = str.substring(offset, offset + len);

      charBuf.replace((int) pos, (int) (pos + replaceString.length()), replaceString);
    } catch (StringIndexOutOfBoundsException e) {
      throw new RuntimeException(e);
    }

    this.charData = charBuf.toString();

    return len;
  }

  /** @see java.sql.Clob#truncate(long) */
  public void truncate(long length) throws SQLException {
    if (length > this.charData.length()) {
      throw new RuntimeException();
    }

    this.charData = this.charData.substring(0, (int) length);
  }

  public void free() throws SQLException {
    this.charData = null;
  }

  public Reader getCharacterStream(long pos, long length) throws SQLException {
    return new StringReader(getSubString(pos, (int) length));
  }
}
