package com.fundamental.proj.delegate;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

/**
 * Created by Daniel Dao on 3/8/16.
 */
@RunWith(Cucumber.class)
@CucumberOptions(
        format = { "pretty", "json:target/cucumber" },
        features = "classpath:cucumber/CartDelegate.feature"
)
public class CartDelegateRunner {
    // Run CartDelegate.feature based on CartDelegateSteps.java
}
