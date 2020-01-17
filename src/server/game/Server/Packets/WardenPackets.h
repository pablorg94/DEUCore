/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef WardenPackets_h__
#define WardenPackets_h__

#include "Packet.h"

namespace WorldPackets
{
    namespace Warden
    {
        class WardenData final : public ClientPacket
        {
        public:
            WardenData(WorldPacket&& packet) : ClientPacket(CMSG_WARDEN_DATA, std::move(packet)) { }

            void Read() override;

            ByteBuffer Data;
        };
    }
}

#endif // WardenPackets_h__
