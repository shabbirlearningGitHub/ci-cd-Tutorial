public with sharing class ContinuationRestCall {

  public String requestLabel;
    // Result of callout
    public String result {get;set;}
    // Callout endpoint as a named credential URL 
    // or, as shown here, as the long-running service URL
    private static final String LONG_RUNNING_SERVICE_URL = 'https://www.google.com';
    public List<JSONAlbums> jsonParserResult {get;set;}
    // Action method
    public Object startRequest() {
        // Create continuation with a timeout
        Continuation con = new Continuation(40);
        // Set callback method
        con.continuationMethod='processResponse';
        
        // Create callout request
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(LONG_RUNNING_SERVICE_URL);
        
        // Add callout request to continuation
        this.requestLabel = con.addHttpRequest(req);
        
        // Return the continuation
        return con;  
    }
    
    // Callback method 
    public Object processResponse() {   
        // Get the response by using the unique label
        HttpResponse response = Continuation.getResponse(this.requestLabel);
        // Set the result variable that is displayed on the Visualforce page
        //this.result = response.getBody();
        this.jsonParserResult = (List<JSONAlbums>) System.JSON.deserialize(response.getBody(), List<JSONAlbums>.class);
        // Return null to re-render the original Visualforce page
        return null;
    }
    
    public class JSONAlbums {
        public Integer userId{get;set;}
        public Integer id{get;set;}
        public String title{get;set;}
    }
    
    

}