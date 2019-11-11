
public class GildedRose {
    let agedBrie = "Aged Brie"
    let backstagePass = "Backstage passes to a TAFKAL80ETC concert"
    let sulfuras = "Sulfuras, Hand of Ragnaros"
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        
        for i in 0..<items.count {
            if (items[i].name == agedBrie) {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1
                }
                items[i].sellIn = items[i].sellIn - 1
                if (items[i].sellIn < 0){
                    if (items[i].quality < 50) {
                        items[i].quality = items[i].quality + 1
                    }
                }


            } else if (items[i].name == backstagePass) {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1

                    if (items[i].sellIn < 11) {
                        if (items[i].quality < 50) {
                            items[i].quality = items[i].quality + 1
                        }
                    }

                    if (items[i].sellIn < 6) {
                        if (items[i].quality < 50) {
                            items[i].quality = items[i].quality + 1
                        }
                    }

                }
                items[i].sellIn = items[i].sellIn - 1
                if (items[i].sellIn < 0){
                    items[i].quality = 0
                }
            } else {
                if (items[i].quality > 0) {
                    if (items[i].name != sulfuras) {
                        items[i].quality = items[i].quality - 1
                        items[i].sellIn = items[i].sellIn - 1
                        if (items[i].sellIn < 0){
                            items[i].quality = items[i].quality - 1
                        }
                    }
                }
            }
        }
    }
}
