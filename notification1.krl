ruleset notification1 {
    meta {
        name "notify example"
        author "Guy Werner"
        logging off
    }
    dispatch {
        // domain "exampley.com"
    }
    rule first_rule {
        select when pageview ".*" setting ()
        // Display notification that will not fade.
        every{
            notify("Hello World", "This is one sample rule.") with sticky = true;
            notify("Hello Again", "This is another sample rule.") with sticky = true;
        }
    }
    rule second_rule {
        select when pageview ".*" setting ()
        pre{
            pageQuery = page:url("query");
        }
        // Display notification that will not fade.        
        if (!pageQuery.match(re/name/)) then {
            notify("Hello Monkey", "") with sticky = true;
        }
    }
    rule third_rule {
        select when pageview ".*" setting ()
        pre{
            pageQuery = page:url("query");
            getName = function(pageQuery){
                arr = pageQuery.extract(re/(name=).*(&)/);
                arr[0];
            };
            name = getName(pageQuery);
        }
        // Display notification that will not fade.
        if (pageQuery.match(re/name/)) then {
            notify("Hello " + name, "") with sticky = true;
        }
    }
}