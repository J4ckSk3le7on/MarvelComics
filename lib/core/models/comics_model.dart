import 'dart:convert';

class ComicsModel {
    String code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    Data data;
    String etag;

    ComicsModel({
        required this.code,
        required this.status,
        required this.copyright,
        required this.attributionText,
        required this.attributionHtml,
        required this.data,
        required this.etag,
    });

    factory ComicsModel.fromRawJson(String str) => ComicsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ComicsModel.fromJson(Map<String, dynamic> json) => ComicsModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: Data.fromJson(json["data"]),
        etag: json["etag"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": [status],
        "copyright": [copyright],
        "attributionText": [attributionText],
        "attributionHTML": [attributionHtml],
        "data": data.toJson(),
        "etag": [etag],
    };
}

class Data {
    int offset;
    int limit;
    int total;
    int count;
    List<ComicsResults> results;

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
        results: List<ComicsResults>.from(json["results"].map((x) => ComicsResults.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ComicsResults {
    int id;
    String digitalId;
    String title;
    String issueNumber;
    String variantDescription;
    String description;
    String modified;
    String isbn;
    String upc;
    String diamondCode;
    String ean;
    String issn;
    String format;
    String pageCount;
    List<TextObject> textObjects;
    String resourceUri;
    List<Url> urls;
    Series series;
    List<Series> variants;
    List<Series> collections;
    List<Series> collectedIssues;
    List<Date> dates;
    List<Price> prices;
    Thumbnail thumbnail;
    List<Thumbnail> images;
    Characters creators;
    Characters characters;
    Stories stories;
    Events events;

    ComicsResults({
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

    factory ComicsResults.fromRawJson(String str) => ComicsResults.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ComicsResults.fromJson(Map<String, dynamic> json) => ComicsResults(
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
        textObjects: List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromJson(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"]),
        variants: List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
        collections: List<Series>.from(json["collections"].map((x) => Series.fromJson(x))),
        collectedIssues: List<Series>.from(json["collectedIssues"].map((x) => Series.fromJson(x))),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromJson(x))),
        creators: Characters.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        stories: Stories.fromJson(json["stories"]),
        events: Events.fromJson(json["events"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": [title],
        "issueNumber": issueNumber,
        "variantDescription": [variantDescription],
        "description": [description],
        "modified": modified,
        "isbn": [isbn],
        "upc": [upc],
        "diamondCode": [diamondCode],
        "ean": [ean],
        "issn": [issn],
        "format": [format],
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects.map((x) => x.toJson())),
        "resourceURI": [resourceUri],
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "series": series.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
        "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x.toJson())),
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
    };
}

class Characters {
    String available;
    String returned;
    String collectionUri;
    List<CharactersItem> items;

    Characters({
        required this.available,
        required this.returned,
        required this.collectionUri,
        required this.items,
    });

    factory Characters.fromRawJson(String str) => Characters.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<CharactersItem>.from(json["items"].map((x) => CharactersItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": [collectionUri],
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class CharactersItem {
    String resourceUri;
    String name;
    String role;

    CharactersItem({
        required this.resourceUri,
        required this.name,
        required this.role,
    });

    factory CharactersItem.fromRawJson(String str) => CharactersItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CharactersItem.fromJson(Map<String, dynamic> json) => CharactersItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": [resourceUri],
        "name": [name],
        "role": [role],
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
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": [resourceUri],
        "name": [name],
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
        "type": [type],
        "date": date,
    };
}

class Events {
    String available;
    String returned;
    String collectionUri;
    List<Series> items;

    Events({
        required this.available,
        required this.returned,
        required this.collectionUri,
        required this.items,
    });

    factory Events.fromRawJson(String str) => Events.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Events.fromJson(Map<String, dynamic> json) => Events(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": [collectionUri],
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
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
        path: json["path"]!,
        extension: json["extension"]!,
    );

    Map<String, dynamic> toJson() => {
        "path": [path],
        "extension": [extension],
    };
}

class Price {
    String type;
    String price;

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
        "type": [type],
        "price": price,
    };
}

class Stories {
    String available;
    String returned;
    String collectionUri;
    List<StoriesItem> items;

    Stories({
        required this.available,
        required this.returned,
        required this.collectionUri,
        required this.items,
    });

    factory Stories.fromRawJson(String str) => Stories.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": [collectionUri],
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class StoriesItem {
    String resourceUri;
    String name;
    String type;

    StoriesItem({
        required this.resourceUri,
        required this.name,
        required this.type,
    });

    factory StoriesItem.fromRawJson(String str) => StoriesItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": [resourceUri],
        "name": [name],
        "type": [type],
    };
}

class TextObject {
    String type;
    String language;
    String text;

    TextObject({
        required this.type,
        required this.language,
        required this.text,
    });

    factory TextObject.fromRawJson(String str) => TextObject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "type": [type],
        "language": [language],
        "text": [text],
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
        "type": [type],
        "url": [url],
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
