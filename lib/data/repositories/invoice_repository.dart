import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:invoiceninja_flutter/data/models/serializers.dart';
import 'package:built_collection/built_collection.dart';

import 'package:invoiceninja_flutter/redux/auth/auth_state.dart';
import 'package:invoiceninja_flutter/data/models/models.dart';
import 'package:invoiceninja_flutter/data/web_client.dart';

class InvoiceRepository {
  final WebClient webClient;

  const InvoiceRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<InvoiceEntity>> loadList(CompanyEntity company, AuthState auth) async {

    final dynamic response = await webClient.get(
        auth.url + '/invoices?include=invitations', company.token);

    final InvoiceListResponse invoiceResponse = serializers.deserializeWith(
        InvoiceListResponse.serializer, response);

    return invoiceResponse.data;
  }

  Future saveData(CompanyEntity company, AuthState auth, InvoiceEntity invoice, [EntityAction action]) async {

    final data = serializers.serializeWith(InvoiceEntity.serializer, invoice);
    dynamic response;

    if (invoice.isNew) {
      response = await webClient.post(
          auth.url + '/invoices?include=invitations', company.token, json.encode(data));
    } else {
      var url = auth.url + '/invoices/' + invoice.id.toString();
      if (action != null) {
        url += '?action=' + action.toString();
      }
      response = await webClient.put(url, company.token, json.encode(data));
    }

    final InvoiceItemResponse invoiceResponse = serializers.deserializeWith(
        InvoiceItemResponse.serializer, response);

    return invoiceResponse.data;
  }
}