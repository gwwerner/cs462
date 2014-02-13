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
        notify("Hello World", "This is one sample rule.") with sticky = true;
    }
    rule second_rule {
        select when pageview ".*" setting ()
        // Display notification that will not fade.
        notify("Hello Again", "This is another sample rule.") with sticky = true;
    }
}