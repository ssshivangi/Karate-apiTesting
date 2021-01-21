package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class LoadTestingSimulation extends Simulation {

  val getTransactions = scenario("Top Rated Movies").exec(karateFeature("classpath:rateMovies_POST.feature"))
  setUp(
    getTransactions.inject(rampUsers(100) during  (60 seconds))
  )

}
