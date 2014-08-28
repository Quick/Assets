//
// DolphinSpec.swift
//

import Quick
import Nimble
import Sea

class DolphinSpec: QuickSpec {
  override func spec() {

    describe("a dolphin") {

      var dolphin: Dolphin!
      beforeEach {
        let position = Position(longitude: 78.304129, latitude: 28.291769, depth: 20.0)
        dolphin = Dolphin(position: position)
        Ocean.sharedOcean.add(dolphin)
      }
      
      describe("click") {
        context("when it's not near anything interesting") {
          it("emits only one click") {
            expect(dolphin.click()).to(equal("Click!"))
          }
        }
        
        context("when it's near something interesting") {
          beforeEach {
            let position = Position(longitude: 78.304129, latitude: 28.291769, depth: 40.0)
            Ocean.sharedOcean.add(SunkenShip(position: position))
          }
          it("emits a series of clicks") {
            expect(dolphin.click()).to(equal("Click, click, click!"))
          }
        }
      }
    }
  }
}
