package webench.meta;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import webench.meta.argument.Args;
import com.beust.jcommander.JCommander;
import com.beust.jcommander.ParameterException;
import org.junit.jupiter.api.Test;

public class ArgumentTest {
  @Test
  public void testArgs() {
    final Args args = new Args();
    final String[] argv = {
      "--warmup",
      "2",
      "--time",
      "30",
      "-w",
      "ecommerce",
      "-th",
      "100",
      "--populateDb",
      "--scale",
      "1"
    };
    JCommander.newBuilder().addObject(args).build().parse(argv);
    assertEquals(args.getBenchmarkTime(), 30);
    assertEquals(args.getWarmUpTime(), 2);
    assertEquals(args.getWorkloadType(), "ecommerce");
    assertEquals(args.getNumThreads(), 100);
    assertEquals(args.getScale(), 1);
    assertTrue(args.isPopulateDatabase());
  }

  @Test
  public void testInvalidArgs() {
    final Args args = new Args();
    final String[] argv = {"--scale", "100"};
    try {
      JCommander.newBuilder().addObject(args).build().parse(argv);
    } catch (ParameterException e) {
      return;
    }
    assert false;
  }
}
