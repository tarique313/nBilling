

package jbilling

class JBillingDisplayTagLib {

    /**
     * Prints the phone number is a nice format
     */
    def phoneNumber = { attrs, body ->
        
        def countryCode= attrs.countryCode
        def areaCode= attrs.areaCode 
        def number= attrs.number
        
        StringBuffer sb= new StringBuffer("");
        
        if (countryCode) {
            sb.append(countryCode).append("-")
        }
        
        if (areaCode) {
            sb.append(areaCode).append("-")
        }
        if (number) {
            
            if (number.length() > 4) {
                char[] nums= number.getChars()
                
                int i=0;
                for(char c: nums) {
                   //check if this value is a number between 0 and 9
                   if (c < 58 && c > 47 ) {
                       if (i<3) {
                           sb.append(c)
                           i++
                       } else if (i == 3) {
                           sb.append("-").append(c)
                           i++
                       } else {
                           sb.append(c)
                           i++
                       }
                   }
                }
            } else {
                sb.append(number)
            }
        }
        
        out << sb.toString()
    }

}