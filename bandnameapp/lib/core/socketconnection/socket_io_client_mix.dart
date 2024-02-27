import 'package:socket_io_client/src/manager.dart';
import 'package:socket_io_common/src/util/event_emitter.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketIOClientMix implements Socket {
  final Socket socket;

  @override
  Map get acks => socket.acks;

  @override
  dynamic get auth => socket.auth;

  @override
  bool get connected => socket.connected;

  @override
  bool get disconnected => socket.disconnected;

  @override
  Map get flags => socket.flags;

  @override
  String? get id => socket.id;

  @override
  num get ids => socket.ids;

  @override
  Manager get io => socket.io;

  @override
  Socket get json => socket.json;

  @override
  String? get lastOffset => socket.lastOffset;

  @override
  String get nsp => socket.nsp;

  @override
  Map? get opts => socket.opts;

  @override
  String? get pid => socket.pid;

  @override
  String? get query => socket.query;

  @override
  List get receiveBuffer => socket.receiveBuffer;

  @override
  List get sendBuffer => socket.sendBuffer;

  @override
  List? get subs => socket.subs;

  SocketIOClientMix({required this.socket});

  @override
  Function ack(id) {
    return socket.ack(id);
  }

  @override
  bool get active => socket.active;

  @override
  void clearListeners() {
    socket.clearListeners();
  }

  @override
  Socket close() {
    return socket.close();
  }

  @override
  Socket compress(compress) {
    return socket.compress(compress);
  }

  @override
  Socket connect() {
    return socket.connect();
  }

  @override
  void destroy() {
    socket.destroy();
  }

  @override
  Socket disconnect() {
    return socket.disconnect();
  }

  @override
  void dispose() {
    socket.dispose();
  }

  @override
  void emit(String event, [data]) {
    socket.emit(event, [data]);
  }

  @override
  void emitBuffered() {
    socket.emitBuffered();
  }

  @override
  void emitWithAck(String event, data, {Function? ack, bool binary = false}) {
    socket.emitWithAck(event, data, ack: ack, binary: binary);
  }

  @override
  bool hasListeners(String event) {
    return socket.hasListeners(event);
  }

  @override
  void off(String event, [EventHandler? handler]) {
    socket.off(event, handler);
  }

  @override
  void offAny([AnyEventHandler? handler]) {
    socket.offAny(handler);
  }

  @override
  void on(String event, EventHandler handler) {
    socket.on(event, handler);
  }

  @override
  void onAny(AnyEventHandler handler) {
    socket.onAny(handler);
  }

  @override
  void onack(Map packet) {
    socket.onack(packet);
  }

  @override
  void once(String event, EventHandler handler) {
    socket.once(event, handler);
  }

  @override
  void onclose(reason) {
    socket.onclose(reason);
  }

  @override
  void onconnect(id, pid) {
    socket.onconnect(id, pid);
  }

  @override
  void ondisconnect() {
    socket.ondisconnect();
  }

  @override
  void onerror(err) {
    socket.onerror(err);
  }

  @override
  void onevent(Map packet) {
    socket.onevent(packet);
  }

  @override
  void onopen([_]) {
    socket.onopen(_);
  }

  @override
  void onpacket(packet) {
    socket.onpacket(packet);
  }

  @override
  Socket open() {
    return socket.open();
  }

  @override
  void packet(Map packet) {
    return socket.packet(packet);
  }

  @override
  Socket send(List args) {
    return socket.send(args);
  }

  @override
  void sendConnectPacket(Map? data) {
    socket.sendConnectPacket(data);
  }

  @override
  void subEvents() {
    return socket.subEvents();
  }

  @override
  set acks(Map acks) {
    this.acks = acks;
  }

  @override
  set auth(auth) {
    this.auth = auth;
  }

  @override
  set connected(bool connected) {
    this.connected = connected;
  }

  @override
  set disconnected(bool disconnected) {
    this.disconnected = disconnected;
  }

  @override
  set flags(Map flags) {
    this.flags = flags;
  }

  @override
  set id(String? id) {
    this.id = id;
  }

  @override
  set ids(num ids) {
    this.ids = ids;
  }

  @override
  set io(Manager io) {
    this.io = io;
  }

  @override
  set json(Socket json) {
    this.json = json;
  }

  @override
  set lastOffset(String? lastOffset) {
    this.lastOffset = lastOffset;
  }

  @override
  set nsp(String nsp) {
    this.nsp = nsp;
  }

  @override
  set opts(Map? opts) {
    this.opts = opts;
  }

  @override
  set pid(String? pid) {
    this.pid = pid;
  }

  @override
  set query(String? query) {
    this.query = query;
  }

  @override
  set receiveBuffer(List receiveBuffer) {
    this.receiveBuffer = receiveBuffer;
  }

  @override
  set sendBuffer(List sendBuffer) {
    this.sendBuffer = sendBuffer;
  }

  @override
  set subs(List? subs) {
    this.subs = subs;
  }
}
