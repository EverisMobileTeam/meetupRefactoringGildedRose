@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testQualityOfRegularObject() {
        let items = [Item(name: "foo", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.sellIn, 9);
        XCTAssertEqual(item.quality, 9);
    }

    func testQualityOfRegularObjectAfterSellInExpired() {
        let items = [Item(name: "foo", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 8);
    }

    func testQualityOfRegularObjectCantHaveNegativeValue() {
        let items = [Item(name: "foo", sellIn: 10, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 0);
    }

    func testQualityOfRegularObjectAcceptInitialNegativeValues() {
        let items = [Item(name: "foo", sellIn: 10, quality: -1)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, -1);
    }

    func testQualityOfAgedBrieIncreasesWithTime(){
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0];
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 11)
    }

    func testQualityOfAgedBrieIncreasesDoubleWithTimeWhenSellInExpired(){
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0];
        XCTAssertEqual(item.quality, 12)
    }

    func testQualityOfAgedBrieOverFifty() {
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: 50)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 50);
    }

    func testInitialQualityOfAgedBrieOverFifty() {
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: 51)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 51);
    }

    func testQualitySulfurasRemainsUnchanged(){
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0];
        XCTAssertEqual(item.sellIn, 10)
        XCTAssertEqual(item.quality, 10)
    }

    func testQualityOfBackstagePassesMoreThanTenDaysAway() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.sellIn, 10);
        XCTAssertEqual(item.quality, 11);
    }

    func testQualityOfBackstagePassesMoreThanFiveDaysAway() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 8, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 12);
    }

    func testQualityOfBackstagePassesLessThanFiveDaysAway() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 13);
    }

    func testQualityOfBackstagePassesSellInExpired() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        let item = app.items[0]
        XCTAssertEqual(item.quality, 0);
    }

//    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
//        return [
//            ("testFoo", testFoo),
//        ]
//    }
}
