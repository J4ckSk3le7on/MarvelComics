import 'dart:convert';

class ComicModel {
    int code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    String etag;
    Data data;

    ComicModel({
        required this.code,
        required this.status,
        required this.copyright,
        required this.attributionText,
        required this.attributionHtml,
        required this.etag,
        required this.data,
    });

    factory ComicModel.fromRawJson(String str) => ComicModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toJson(),
    };
}

class Data {
    int offset;
    int limit;
    int total;
    int count;
    List<ComicResult> results;

    Data({
        required this.offset,
        required this.limit,
        required this.total,
        required this.count,
        required this.results,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<ComicResult>.from(json["results"].map((x) => ComicResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ComicResult {
    int id;
    int digitalId;
    String title;
    int issueNumber;
    String variantDescription;
    String description;
    String modified;
    String isbn;
    String upc;
    String diamondCode;
    String ean;
    String issn;
    String format;
    int pageCount;
    List<dynamic> textObjects;
    String resourceUri;
    List<Url> urls;
    Series series;
    List<Series> variants;
    List<dynamic> collections;
    List<dynamic> collectedIssues;
    List<Date> dates;
    List<Price> prices;
    Thumbnail thumbnail;
    List<dynamic> images;
    Characters creators;
    Characters characters;
    Characters stories;
    Characters events;

    ComicResult({
        required this.id,
        required this.digitalId,
        required this.title,
        required this.issueNumber,
        required this.variantDescription,
        required this.description,
        required this.modified,
        required this.isbn,
        required this.upc,
        required this.diamondCode,
        required this.ean,
        required this.issn,
        required this.format,
        required this.pageCount,
        required this.textObjects,
        required this.resourceUri,
        required this.urls,
        required this.series,
        required this.variants,
        required this.collections,
        required this.collectedIssues,
        required this.dates,
        required this.prices,
        required this.thumbnail,
        required this.images,
        required this.creators,
        required this.characters,
        required this.stories,
        required this.events,
    });

    factory ComicResult.fromRawJson(String str) => ComicResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ComicResult.fromJson(Map<String, dynamic> json) => ComicResult(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"]!,
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<dynamic>.from(json["textObjects"].map((x) => x)),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"]),
        variants: List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        creators: Characters.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        stories: Characters.fromJson(json["stories"]),
        events: Characters.fromJson(json["events"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects.map((x) => x)),
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "series": series.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "collections": List<dynamic>.from(collections.map((x) => x)),
        "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x)),
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
    };
}

class Characters {
    int available;
    String collectionUri;
    List<dynamic> items;
    int returned;

    Characters({
        required this.available,
        required this.collectionUri,
        required this.items,
        required this.returned,
    });

    factory Characters.fromRawJson(String str) => Characters.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x)),
        "returned": returned,
    };
}

class Date {
    String type;
    String date;

    Date({
        required this.type,
        required this.date,
    });

    factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
    };
}

class Price {
    String type;
    int price;

    Price({
        required this.type,
        required this.price,
    });

    factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
    };
}

class Series {
    String resourceUri;
    String name;

    Series({
        required this.resourceUri,
        required this.name,
    });

    factory Series.fromRawJson(String str) => Series.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"]!,
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}

class Thumbnail {
    String path;
    String extension;

    Thumbnail({
        required this.path,
        required this.extension,
    });

    factory Thumbnail.fromRawJson(String str) => Thumbnail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}

class Url {
    String type;
    String url;

    Url({
        required this.type,
        required this.url,
    });

    factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
