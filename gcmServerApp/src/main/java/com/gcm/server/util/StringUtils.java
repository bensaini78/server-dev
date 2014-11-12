package com.gcm.server.util;


public abstract class StringUtils {
	
	
	// This method determines if a String is empty.
	public static boolean isEmpty( String str ) {
		return (str == null || str.trim().length() < 1);
	}

	/**
	 * Checks if a String is a valid number.
	 * @param strToCheck
	 * @return true if valid else false
	 */
	public static boolean isValidNumber (String strToCheck) {
		
		try {
			
			if ( StringUtils.isEmpty( strToCheck ) )
				return false;
				
			Double.parseDouble( strToCheck );			
			
		} catch( NumberFormatException nfe ) {
			return false;			
		}

		return true;		
	}
	
	// Determine if String is a Long.  Return false if <code>str</code> is <code>null</code>.
	public static boolean isLong(String str){
		long longVal = 0;
		
		if (isEmpty(str))
			return false;
			
		try	{
			longVal = Long.parseLong(str);
		} catch( NumberFormatException nfe) {
			return false;
		}		
		
		return true;
	}
	
	// Determine if String is a Integer.  Return false if <code>str</code> is <code>null</code>.
	public static boolean isInt(String str){
		int intVal = 0;
		
		if (isEmpty(str))
			return false;
			
		try	{
			intVal = Integer.parseInt(str);
		} catch( NumberFormatException nfe) {
			return false;
		}		
		
		return true;
	}
	
	static public String denull(String s) {
        if (s == null)
           return "";
        return s;
    }

    static public String denull(String s, String replacement) {
        if (s == null)
           return replacement;
        return s;
    }

    static public String quoted(String s) {
        if (s == null)
            return "\"\"";
        return "\"" + s + "\"";
    }

   static public String basename(String s) {
	  return basename(s, "/");
   }

   static public String basename(String s, String token) {
	  if (s == null)
		 return null;

	  int index = s.lastIndexOf(token);
	  if (index >= 0)
		 return s.substring(index+1);

	  return s;
   }

   static public String dirname(String s) {
	  return dirname(s, "/");
   }

   static public String dirname(String s, String token) {
	  if (s == null)
		 return null;

	  int index = s.lastIndexOf(token);
	  if (index >= 0)
		 return s.substring(0, index);

	  return s;
   }


    static public String rightPad(String pInputString,
    int pLen,
    char pPad,
    boolean pTruncate) {
        if (pInputString != null && pInputString.length() == pLen)
            return pInputString;

        int length = pLen;
        StringBuffer sb = new StringBuffer(pLen);

        if (pInputString != null) {
            length = pInputString.length();

            /* just append the whole thing */
            if (length<=pLen)
                sb.append(pInputString);
            else if (pTruncate)
                sb.append(pInputString.substring(0, pLen));
            else
                sb.append(pInputString);

            length = pLen -length;
        }

        while (length-- > 0)
            sb.append(pPad);

        return sb.toString();
    }

    /**
     * If <code>pTruncate</code> is true, truncate end to fit.
     */
    static public String rightPad(String pInputString,
    int pLen,
    char pPad) {
        return rightPad(pInputString, pLen, pPad, true);
    }


    static public String leftPad(String pInputString,
    int pLen,
    char pPad,
    boolean pTruncate) {
    	if (pInputString != null)
    		pInputString = pInputString.trim();
    	
        if (pInputString != null && pInputString.length() == pLen)
            return pInputString;

        int length = pLen;
        StringBuffer sb = new StringBuffer(pLen);
        if (pInputString != null)
            length = pLen -pInputString.length();

        while (length > 0) {
            sb.append(pPad);
            length--;
        }

        if (pInputString != null) {
            if (length==0)
                sb.append(pInputString);
            else if (pTruncate)
                sb.append(pInputString.substring(0, pLen));
            else
                sb.append(pInputString);
        }

        return sb.toString();
    }



    /**
     * If <code>pTruncate</code> is true, truncate end to fit;
     */
    static public String leftPad(String pInputString,
    int pLen,
    char pPad) {
        return leftPad(pInputString, pLen, pPad, true);
    }


    /**
     * Copies <code>pIn</code> into <code>pTarget</code> starting at index
     * <code>pTargetStart</code>. Copies <pLen> chars or entire length of
     * <code>pIn</code> whichever is smaller.
     */
    static public void copyToChars(char[] pTarget,
    int    pTargetStart,
    int    pLen,
    String pIn) {
        if (pIn == null)
            pIn = "";

        int length = pIn.length();
        if (pLen < length)
            length = pLen;

        pIn.getChars(0, length, pTarget, pTargetStart);
    }


    static public void fillChars(char[] pTarget,
    char pC) {
        for (int i=0 ; i<pTarget.length ; i++)
            pTarget[i] = pC;
    }

    static public void removeNullChars(char[] pTarget,
    char pC) {
        for (int i=0 ; i<pTarget.length ; i++)
            if (pTarget[i] == '\0') {pTarget[i] = pC;}
    }


    static public String replace(String pInputString,
    String pOldString,
    String pNewString) {
        StringBuffer sb = new StringBuffer();

        int start = 0;
        int oldStringLength = pOldString.length();

        int index = pInputString.indexOf(pOldString);
        while (index > -1) {
            sb.append(pInputString.substring(start, index));
            sb.append(pNewString);

            start = index +oldStringLength;
            index = pInputString.indexOf(pOldString, start);
        }

        sb.append(pInputString.substring(start));

        return sb.toString();
    }



	/**
	 * Escapes string literal as required by PL/SQL
	 *
	 * @param value java.lang.String - The string to be encoded.
	 * @return - Encoded string
	 *
	 */
	public static String encodePLSQL( String value ) {

		String encodedValue;

		// Escape ' with ''
		encodedValue = replaceStr( "'", "''", value );

		return encodedValue;
	}

	public static String replaceStr( String a, String b, String strOriginal ) {
		try {
			int lena = a.length();
			int lenb = b.length();
			//if strOriginal is null, return null
			if (strOriginal == null || a == null || b == null )
				return null;

			if( strOriginal.length() <= 0 )
				return strOriginal;

			StringBuffer strResult = new StringBuffer( strOriginal );

			// Replace char
			int idx = 0;
			loop:		while( idx >= 0 ) {
				idx = ( strResult.toString( ) ).indexOf( a, idx );
				if( idx < 0 )
					break loop;
				strResult.replace( idx, idx + lena, b );
				idx += lenb;
			}

			return strResult.toString();
		}
		catch( Exception e ) {
			return strOriginal;
		}

	}	
	
	/* remove leading whitespace */
    public static String ltrim(String source) {
        return source.replaceAll("^\\s+", "");
    }

    /* remove trailing whitespace */
    public static String rtrim(String source) {
        return source.replaceAll("\\s+$", "");
    }
    
	//  Remove leading characters from a string. 
	//  
	//  @return java.lang.String String with all leading characters specified by paramter 'c' removed 
	//  @param s java.lang.String Source string 
	//  @param c char Leading characters to remove 
	  
	public static String trimLeft(String s, char c) 
	 { 
	     if(s == null) 
	         return ""; 
	     int len = s.length(); 
	     int n = 0; 
	     while(n < len && s.charAt(n) == c) 
	         ++n; 
	     return s.substring(n); 
	 }     
}



